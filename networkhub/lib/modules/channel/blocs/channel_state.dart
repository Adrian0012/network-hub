part of 'channel_bloc.dart';

abstract class ChannelState extends Equatable {
  const ChannelState();

  @override
  List<Object?> get props => [];
}

class ChannelsInitial extends ChannelState {}

class ChannelsLoading extends ChannelState {}

class ChannelError extends ChannelState {
  final String errorMessage;
  const ChannelError(this.errorMessage);
}

class ChannelLoaded extends ChannelState {
  final List<Channel> channels;
  const ChannelLoaded(this.channels);
}
