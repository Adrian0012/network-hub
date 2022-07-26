import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/repository/channel_repository.dart';
import 'package:networkhub/services/pusher/pusher_service.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelsInitial()) {
    final ChannelRepository channelRepository = ChannelRepository();

    on<GetChannelsList>((event, emit) async {
      emit(ChannelsLoading());
      final List<Channel> channelsList =
          await channelRepository.fetchChannelList();
      if (channelsList.isNotEmpty) {
        PusherService.instance().onPusherSubscribe(null);
        emit(ChannelLoaded(channelsList));
      } else {
        emit(const ChannelError('GET Channels List Error'));
      }
    });
  }
}
