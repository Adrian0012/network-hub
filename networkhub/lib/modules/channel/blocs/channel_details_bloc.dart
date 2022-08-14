import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/repositories/channel.dart';

part 'channel_details_event.dart';
part 'channel_details_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelsInitial()) {
    final ChannelRepository channelRepository = ChannelRepository();

    on<GetChannelsList>((event, emit) async {
      emit(ChannelsLoading());
      final List<Channel> channelsList =
          await channelRepository.fetchChannelList();
      emit(ChannelLoaded(channelsList));
    });
  }
}
