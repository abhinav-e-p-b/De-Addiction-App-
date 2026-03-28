// GENERATED CODE - DO NOT MODIFY BY HAND
// Run: flutter pub run build_runner build
// This is a stub — regenerate after adding Hive adapters.

part of 'streak_model.dart';

class StreakModelAdapter extends TypeAdapter<StreakModel> {
  @override
  final int typeId = 0;

  @override
  StreakModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StreakModel(
      daysSober: fields[0] as int,
      startDate: fields[1] as DateTime,
      bestStreak: fields[2] as int,
      moneySaved: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, StreakModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.daysSober)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.bestStreak)
      ..writeByte(3)
      ..write(obj.moneySaved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreakModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyGoalAdapter extends TypeAdapter<DailyGoal> {
  @override
  final int typeId = 1;

  @override
  DailyGoal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyGoal(
      id: fields[0] as String,
      title: fields[1] as String,
      subtitle: fields[2] as String,
      isCompleted: fields[3] as bool,
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, DailyGoal obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.isCompleted)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyGoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
