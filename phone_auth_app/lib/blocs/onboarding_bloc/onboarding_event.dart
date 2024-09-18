abstract class OnboardingEvent {}

class PageChangedEvent extends OnboardingEvent {
  final int pageIndex;

  PageChangedEvent(this.pageIndex);
}

class NextPageEvent extends OnboardingEvent {
  NextPageEvent();
}

class SkipEvent extends OnboardingEvent {}
