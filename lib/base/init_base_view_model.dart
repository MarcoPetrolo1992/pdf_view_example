
import 'package:flutter/material.dart';
import 'package:pdf_view_example/base/base_view_model.dart';
import 'package:provider/provider.dart';

mixin InitBaseViewModel<T extends BaseViewModel> {
  T initBaseViewModel(BuildContext context) {
    // GET VIEWMODEL
    T viewModel = Provider.of<T>(context);
    //Imposto il BuildContext; ricordo che questo è quello passato in didChangeDependencies, quindi è il context della root della pagina.
    viewModel.context = context;
    // RETURN VIEWMODEL
    return viewModel;
  }
}
