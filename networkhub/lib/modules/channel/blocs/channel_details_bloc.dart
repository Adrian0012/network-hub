import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networkhub/common/authentication/models/user.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:networkhub/modules/channel/repositories/channel_repository.dart';

part 'channel_details_event.dart';
part 'channel_details_state.dart';

class ChannelDetailsBloc
    extends Bloc<ChannelDetailsEvent, ChannelDetailsState> {
  final StreamController<Map<String, dynamic>> eventDataController =
      StreamController<Map<String, dynamic>>.broadcast();

  ChannelDetailsBloc() : super(ChannelDetailsInitial()) {
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
        emit(ChannelDetailsLoaded(List.from(state.messages)..add(newMessage)));
      }
    });
    authenticationStatusSubscription = userStream.listen((event) {
      print('STREAM - $event');
    });
  }
  late StreamSubscription<dynamic> authenticationStatusSubscription;

  Stream<Map<String, dynamic>> get userStream => eventDataController.stream;
}
