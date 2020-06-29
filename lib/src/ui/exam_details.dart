import 'package:appsaudeemmaos/src/models/exam_model.dart';
import 'package:appsaudeemmaos/src/models/user_model.dart';
import 'package:appsaudeemmaos/src/utils/data_util.dart';
import 'package:flutter/material.dart';

class ExamDetailsScreen extends StatefulWidget {
  Exam exam;

  ExamDetailsScreen(this.exam);

  @override
  _ExamDetailsScreenState createState() => _ExamDetailsScreenState();
}

class _ExamDetailsScreenState extends State<ExamDetailsScreen> {
  Exam examDetails;

  @override
  void initState() {
    examDetails = widget.exam;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "#" + examDetails.examId.toString() + " - Detalhes",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Dados do Paciente:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Nome: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(User.name)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "CPF: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(User.cpf)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Número do Plano: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(User.insuranceNumber)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Telefone: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(User.phone)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Data de Nascimento: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(DataUtil.formatData(User.birthDate))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Dados do Médico:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Nome: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.doctor.name)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "CRM: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.doctor.crm)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Dados da Clínica:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Nome: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.clinic.name)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "CNPJ: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.clinic.cnpj)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Telefone: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.clinic.phone)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Rua: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.clinic.address.street)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Número: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.clinic.address.number)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Cidadde: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.clinic.address.city)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "Estado: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.clinic.address.state)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Dados do Exame:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Código: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(examDetails.examId.toString())
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Tipo: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(examDetails.examType + "fdsfd asfa sdf sad fs a df", softWrap: true,),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Status: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(Exam.statusExam(examDetails.examStatus))
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Data da Requisição: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(DataUtil.formatData(examDetails.examRequestedDateTime))
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        "Data de Conclusão: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(DataUtil.formatData(examDetails.exameCompletedDate))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
