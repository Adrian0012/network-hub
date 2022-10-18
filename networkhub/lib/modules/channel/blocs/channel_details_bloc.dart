import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networkhub/common/authentication/models/user.dart';
import 'package:networkhub/common/authentication/repositories/user_repository.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:networkhub/modules/channel/repositories/channel_repository.dart';
import 'package:networkhub/services/pusher/pusher_service.dart';

part 'channel_details_event.dart';
part 'channel_details_state.dart';

class ChannelDetailsBloc
    extends Bloc<ChannelDetailsEvent, ChannelDetailsState> {
  final UserRepository _userRepository;
  ChannelDetailsBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(ChannelDetailsInitial()) {
    final ChannelRepository channelRepository = ChannelRepository();

    on<GetChannelDetails>((event, emit) async {
      emit(ChannelDetailsLoading());
      final List<ChannelMessage> channelMessages = await channelRepository
          .fetchChannelMessages(event.channel.channelHash);
      if (channelMessages.isNotEmpty) {
        emit(ChannelDetailsLoaded(channelMessages));
      } else {
        emit(const ChannelDetailsError('GET Channels Messages Error'));
      }
    });

    on<SendChannelMessage>((event, emit) async {
      if (state is ChannelDetailsLoaded) {
        final state = this.state as ChannelDetailsLoaded;
        const User user = User(
          userHash: '',
          email: 'adrian@code.je',
          firstName: 'Adrian',
          lastName: 'Lang',
          country: 'Jersey',
          profileImage: '',
          userColor: '',
        );
        final ChannelMessage newMessage =
            ChannelMessage(null, event.message, user, DateTime.now(), null);
        emit(
          ChannelDetailsLoaded(List.from(state.messages)..add(newMessage)),
        );
      }
    });

    on<ReceiveChannelMessage>((event, emit) async {
      if (state is ChannelDetailsLoaded) {
        final state = this.state as ChannelDetailsLoaded;
        final User user = _userRepository.userStreamController.value;
        final ChannelMessage newMessage = ChannelMessage(
            null, event.message['message'], user, DateTime.now(), null);
        emit(
          ChannelDetailsLoaded(List.from(state.messages)..add(newMessage)),
        );
      }
    });
    // psuher listener
    PusherService.instance().messagesStreamController.stream.listen((event) {
      if (event['message'] != null) {
        add(ReceiveChannelMessage(event));
      }
    });
  }
}
