part of 'channel_details_bloc.dart';

abstract class ChannelDetailsState extends Equatable {
  const ChannelDetailsState();

  @override
  List<Object?> get props => [];
}

class ChannelDetailsInitial extends ChannelDetailsState {}

class ChannelDetailsLoading extends ChannelDetailsState {}

class ChannelDetailsMessage extends ChannelDetailsState {}

class ChannelDetailsError extends ChannelDetailsState {
  final String errorMessage;
  const ChannelDetailsError(this.errorMessage);
}

class ChannelDetailsLoaded extends ChannelDetailsState {
  final List<ChannelMessage> messages;
  final String channelHash;
  const ChannelDetailsLoaded(this.messages, this.channelHash);

  @override
  List<Object?> get props => [messages];
}

class ChannelDetailsSendMessage extends ChannelDetailsState {
  final String message;
  const ChannelDetailsSendMessage(this.message);
}
