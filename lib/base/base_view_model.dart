import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  //----------------------------------------------------------------------------
  // Parametri di classe
  //----------------------------------------------------------------------------

  ValueNotifier<bool> progress = ValueNotifier(false);
  ValueNotifier<bool> absorbPointerLayerProgress = ValueNotifier(false);
  late BuildContext context;
  bool mounted = true;

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // METODI DI CLASSE
  //----------------------------------------------------------------------------

  ///
  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  /// Mostro la progress senza ridisegnare la view.
  showProgress() {
    progress.value = true;
    progress.notifyListeners();
  }

  /// Dismetto la progress e refresho la view.
  dismissProgress() {
    progress.value = false;
    notifyListeners();
  }

  /// Mostro la progress senza ridisegnare la view.
  showAbsorbPointerLayerProgress() {
    absorbPointerLayerProgress.value = true;
    absorbPointerLayerProgress.notifyListeners();
  }

  /// Dismetto la progress e refresho la view.
  dismissAbsorbPointerLayerProgress() {
    absorbPointerLayerProgress.value = false;
    notifyListeners();
  }

  /// Ritorno enum con le dimensioni dello schermo basate sull'altezza
/*  ScreenSizeType getScreenSizeType() {
    if (MediaQuery.of(context).size.height <= 700) {
      return ScreenSizeType.small;
    }

    return ScreenSizeType.large;
  }*/

  ///
  @override
  void notifyListeners() {
    if (!mounted) return;
    super.notifyListeners();
  }

  /// Gestisce gli eventuali warning,errori ed action poi restituisce
  /// true se non ci sono errori, false in caso contrario.
  /// Se ci sono errori non esiste una risposta valida, quindi gestisce
  /// l'errore(eventualmente con action)poi restituisce false.
  /// La modale relativa all'errore così sollevata non viene attesa, quindi il
  /// verrà restituito false prima che questa chiuda; tipicamente una risposta
  /// false da parte di questo metodo non dovrebbe essere seguita da nessuna
  /// altra azione, poichè come detto non esiste una risposta valida.
  ///
  /// Se c'è un warning(account deferred), viene sollevata la modale di AccountDeferred,
  /// poi alla chiusura della stess viene restituito true.
  ///
  /// in assenza di errori o warning verrà sempilcemente restituito true.
  /*Future<bool> itsOkAfterManageError(DataManagerResponse dmr) async {
    //--------------------------------------------------
    // CASO 1: NESSUN ERRRE
    //--------------------------------------------------
    //Assenza di errori e di warning devo solo restituire true.
    //--------------------------------------------------
    if (!dmr.hasError() && !dmr.hasWarning()) {
      return true;
    }

    //--------------------------------------------------
    // CASO 2: WARNING CON ACTION+++++++++++++++++++
    //--------------------------------------------------
    //Esiste un warning che richiede una Action, la gestisco poi restituisco true.
    //--------------------------------------------------
    if (dmr.hasWarningRequiredAction()) {
      switch (dmr.warning!.requiredAction) {
        default:
          Fluttertoast.showToast(msg: dmr.warning!.message, gravity: ToastGravity.CENTER, toastLength: Toast.LENGTH_LONG);
      }
      return true;
    }

    //--------------------------------------------------
    // CASO 2: WARNING SENZA ACTION
    //--------------------------------------------------
    //Esiste un warning generico che non richiede una specifica action, devo mostrare
    // un toast con il messaggio di Warning come azione di default.
    if (dmr.hasWarning()) {
      //Toast.show(dmr.warning.message, rootPageContext, gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      Fluttertoast.showToast(msg: dmr.warning!.message, gravity: ToastGravity.CENTER, toastLength: Toast.LENGTH_LONG);
      return true;
    }

    //--------------------------------------------------
    // CASO 2: ERRORE CON ACTION
    //--------------------------------------------------
    //Esiste un errore che richiede una action, la gestisco e senza aspettare restituisco false.
    if (dmr.hasRequiredAction()) {
      switch (dmr.error!.requiredAction) {
        case DataManagerAction.ERR_ACTION_REQUIRE_LOGON:
          //await managerUser.logoutCRM();
          FeedbackErrorManager._showFeedbackRequiredLogon();
          break;

        case DataManagerAction.WARN_ACTION_COMPLETE_PROFILE:
          FeedbackErrorManager._showFeedbackCompleteProfile();
          break;

        case DataManagerAction.ERR_ACTION_REQUIRE_CHANGE_USER_OR_REINSTALL_APP:
          FeedbackErrorManager._showFeedbackErroreBloccanteCambioUser(dmr.error!);
          break;

        case DataManagerAction.ERR_ACTION_REQUIRE_REINSTALL_APP:
        case DataManagerAction.ERR_ACTION_REQUIRE_RESTART_APP:
        case DataManagerAction.ERR_ACTION_REQUIRE_UPGRADE_APP:
        case DataManagerAction.ERR_ACTION_SEND_ERROR_TO_ADMIN:
          FeedbackErrorManager._showFeedbackErroreBloccanteApp(dmr.error!);
          break;

        case DataManagerAction.ERR_ACTION_RETRY_LATER:
          FeedbackErrorManager._showFeedbackNessunaConnessione(dmr.error!);
          break;

        default:
          FeedbackErrorManager._showFeedbackGenericError(dmr.error!);
          break;
      }
      return false;
    }

    //--------------------------------------------------
    // CASO 2: ERRORE SENZA ACTION
    //--------------------------------------------------
    // Esiste un errore generico che non richiede specifiche action; lo gestisco e senza aspettare restituisco false.
    FeedbackErrorManager._showFeedbackGenericError(dmr.error!);
    return false;
  }*/

//----------------------------------------------------------------------------
}
