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
  const SendChannelMessage(this.message);

  @override
  List<Object> get props => [message];
}
