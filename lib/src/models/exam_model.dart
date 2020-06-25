import 'package:flutter/material.dart';

class ExamModel{
  int examCode;
  String examType;
  String examResults;
  DateTime examDate;
  String examStatus;
  bool isExpanded = false;

  ExamModel(this.examCode, this.examType, this.examResults, this.examDate, this.examStatus);
}