import 'package:flutter/material.dart';

class ExamModel{
  int examCode;
  String examName;
  String examResults;
  DateTime examDate;
  bool isExpanded = false;

  ExamModel(this.examCode, this.examName, this.examResults, this.examDate);
}