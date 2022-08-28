import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:networkhub/modules/channel/repositories/channel.dart';

part 'channel_details_event.dart';
part 'channel_details_state.dart';

class ChannelDetailsBloc
    extends Bloc<ChannelDetailsEvent, ChannelDetailsState> {
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
      print(event.message);
      // final List<Channel> channelsList =
      //     await channelRepository.fetchChannelList();
      // if (channelsList.isNotEmpty) {
      //   emit(ChannelDetailsLoaded(channelsList));
      // } else {
      //   emit(const ChannelDetailsError('GET Channels List Error'));
      // }
    });
  }
}
