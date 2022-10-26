part of 'channel_details_bloc.dart';

abstract class ChannelDetailsEvent extends Equatable {
  const ChannelDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetChannelDetails extends ChannelDetailsEvent {
  final Channel channel;
  const GetChannelDetails(this.channel);
}

class SendChannelMessage extends ChannelDetailsEvent {
  final String message;
  final String channelHash;
  const SendChannelMessage(this.message, this.channelHash);

  @override
  List<Object> get props => [message, channelHash];
}

class ReceiveChannelMessage extends ChannelDetailsEvent {
  final PusherResponse data;
  const ReceiveChannelMessage(this.data);

  @override
  List<Object> get props => [data];
}
