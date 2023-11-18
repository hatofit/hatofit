enum MoodEnum { happy, good, neutral, sad, awful }

extension MoodEnumExtension on MoodEnum {
  String get emoji {
    switch (this) {
      case MoodEnum.happy:
        return '😄';
      case MoodEnum.good:
        return '😊';
      case MoodEnum.neutral:
        return '😐';
      case MoodEnum.sad:
        return '😔';
      case MoodEnum.awful:
        return '😢';
    }
  }

  String get mood {
    switch (this) {
      case MoodEnum.happy:
        return 'Happy';
      case MoodEnum.good:
        return 'Good';
      case MoodEnum.neutral:
        return 'Neutral';
      case MoodEnum.sad:
        return 'Sad';
      case MoodEnum.awful:
        return 'Awful';
    }
  }
}

class MoodUtils {
  static String message(String mood) {
    switch (mood) {
      case 'happy':
        return MoodEnum.happy.mood + MoodEnum.happy.emoji;
      case 'good':
        return MoodEnum.good.mood + MoodEnum.good.emoji;
      case 'neutral':
        return MoodEnum.neutral.mood + MoodEnum.neutral.emoji;
      case 'sad':
        return MoodEnum.sad.mood + MoodEnum.sad.emoji;
      case 'awful':
        return MoodEnum.awful.mood + MoodEnum.awful.emoji;
      default:
        return '';
    }
  }
}
