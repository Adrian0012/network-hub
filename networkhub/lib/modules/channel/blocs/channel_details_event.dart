part of 'channel_details_bloc.dart';

abstract class ChannelDetailsEvent extends Equatable {
  const ChannelDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetChannelDetails extends ChannelDetailsEvent {}
