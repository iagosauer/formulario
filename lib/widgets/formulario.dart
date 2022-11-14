import 'package:flutter/material.dart';

class Customformulario extends StatelessWidget {
  Customformulario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextLabel(texto: 'Data'),
              CustomTextField(
                controler: controladores.controlerDate,
                icon: Icons.calendar_month,
                data: true,
              ),
              CustomTextLabel(texto: 'Propriedade'),
              CustomDropDownButtonForm<PropriedadeModel>(
                list: listaPropriedades,
                controler: controladores.controlerFazenda,
                icon: Icons.home,
              ),
              CustomTextLabel(texto: 'Tipo Pecuária'),
              CustomDropDownButtonForm<PecuariaModel>(
                list: listaTipoPecuaria,
                controler: controladores.controlerTipo,
                icon: Icons.pets,
              ),
              CustomTextLabel(texto: 'Finalidade'),
              CustomDropDownButtonForm(
                list: listaFinalidade,
                controler: controladores.controlerFinalidade,
                icon: Icons.list,
              ),
              CustomTextLabel(texto: 'Tipo E/S'),
              CustomDropDownButtonForm(
                list: ListaEntradaSaida,
                controler: controladores.controlerEntradaSaida,
                icon: Icons.transit_enterexit,
              ),
              CustomTextLabel(texto: 'Motivo'),
              ValueListenableBuilder<String>(
                  valueListenable: controladores.controlerEntradaSaida,
                  builder: (context, entraSaida, _) {
                    if (entraSaida == 'ENTRADA') {
                      ListaMotivos = ListaMotivosEntrada;
                    } else {
                      ListaMotivos = ListaMotivosSaida;
                    }
                    controladores.controlerMotivo.value = ListaMotivos[0];
                    return CustomDropDownButtonForm(
                      list: ListaMotivos,
                      controler: controladores.controlerMotivo,
                      icon: Icons.abc,
                    );
                  }),
              CustomTextLabel(texto: 'Idade (meses)'),
              CustomTextField(
                controler: controladores.controlerIdade,
                labelHint: 'Idade',
                icon: Icons.calendar_view_month,
                inteiro: true,
              ),
              CustomTextLabel(texto: 'Sexo'),
              CustomDropDownButtonForm(
                list: ListaSexo,
                controler: controladores.controlerSexo,
                icon: Icons.male,
              ),
              CustomTextLabel(texto: 'Quantidade'),
              CustomTextField(
                controler: controladores.controlerQuantidade,
                labelHint: 'Quantidade',
                icon: Icons.numbers,
                inteiro: true,
              ),
              const SizedBox(
                height: Valor.distancia,
              ),
              CustomBotaoCadastrar(
                controladores: controladores,
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
