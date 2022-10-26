import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networkhub/common/authentication/models/user.dart';
import 'package:networkhub/common/authentication/repositories/user_repository.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:networkhub/modules/channel/repositories/channel_repository.dart';
import 'package:networkhub/services/pusher/models/pusher_response.dart';
import 'package:networkhub/services/pusher/pusher_service.dart';

part 'channel_details_event.dart';
part 'channel_details_state.dart';

class ChannelDetailsBloc
    extends Bloc<ChannelDetailsEvent, ChannelDetailsState> {
  final UserRepository _userRepository;
  final PusherService _pusherService;
  ChannelDetailsBloc({
    required UserRepository userRepository,
    required PusherService pusherService,
  })  : _userRepository = userRepository,
        _pusherService = pusherService,
        super(ChannelDetailsInitial()) {
    final ChannelRepository channelRepository = ChannelRepository();

    on<GetChannelDetails>((event, emit) async {
      emit(ChannelDetailsLoading());
      final List<ChannelMessage> channelMessages = await channelRepository
          .fetchChannelMessages(event.channel.channelHash);
      if (channelMessages.isNotEmpty) {
        PusherService.instance().onPusherSubscribe(
          event.channel.channelHash,
        );
        emit(ChannelDetailsLoaded(channelMessages, event.channel.channelHash));
      } else {
        PusherService.instance().onPusherSubscribe(event.channel.channelHash);
        emit(ChannelDetailsLoaded(const [], event.channel.channelHash));
      }
    });

    on<SendChannelMessage>((event, emit) async {
      if (state is ChannelDetailsLoaded) {
        final state = this.state as ChannelDetailsLoaded;
        final User user = _userRepository.userStreamController.value;
        final ChannelMessage newMessage = ChannelMessage(
            null, event.message, user, DateTime.now(), event.channelHash);
        channelRepository.sendMessage(newMessage);
        emit(
          ChannelDetailsLoaded(
            List.from(state.messages)..insert(0, newMessage),
            event.channelHash,
          ),
        );
      }
    });

    on<ReceiveChannelMessage>((event, emit) async {
      if (state is ChannelDetailsLoaded) {
        final state = this.state as ChannelDetailsLoaded;
        final ChannelMessage newMessage = ChannelMessage(
          null,
          event.data.message,
          event.data.fromUser,
          DateTime.now(),
          event.data.channelHash,
        );
        emit(
          ChannelDetailsLoaded(
            List.from(state.messages)..insert(0, newMessage),
            event.data.channelHash as String,
          ),
        );
      }
    });
    // pusher listener
    _pusherService.messagesStreamController.stream.listen((event) {
      add(ReceiveChannelMessage(event));
    });
  }
  @override
  Future<void> close() {
    _pusherService.messagesStreamController.close();
    return super.close();
  }
}
