part of 'channel_details_bloc.dart';

abstract class ChannelDetailsState extends Equatable {
  const ChannelDetailsState();

  @override
  List<Object?> get props => [];
}

class ChannelDetailsInitial extends ChannelDetailsState {}

class ChannelDetailsLoading extends ChannelDetailsState {}

class ChannelDetailsLoaded extends ChannelDetailsState {
  final List<ChannelMessage> messages;
  const ChannelDetailsLoaded(this.messages);
}
