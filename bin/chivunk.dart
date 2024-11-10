import 'dart:io';
import 'dart:async';

class BotClock {
  Stream<int> inputStream() {
    int i = 0;

    return Stream.periodic(Duration(seconds: 1), (int _) => i++);
  }
}

void main() {
  var botClock = BotClock();
  var timeoutStream = botClock.inputStream().listen(
        (event) => print('Tempo ocioso: $event'),
        onDone: () => print('Função deu timeout'),
      );

  // Aqui você pode adicionar a lógica para interromper o timer quando o usuário digitar algo

  // Exemplo de como interromper o timer após 5 segundos
  Timer(Duration(seconds: 5), () {
    timeoutStream.cancel();
  });

  //Valor padrão para o número de rodadas, tempo de cada rodada e tempo de descanso
  int round = 1;
  double timeRound = 1.0;
  double timeRest = 1.0;

  void configurar() {
    //Alteração de valores padrão caso o usuário desejar
    //Quando usar no flutter será algo mais visual em vez de digitar como rolagem de tela como no cronometro do cell
    int option = int.parse(stdin.readLineSync()!);
    print(
        "Deseja alterar:\n [1] - Round\n [2] - Tempo de cada rodada\n [3] - Tempo de descanso\n [4] - Sair");
    switch (option) {
      case 1:
        print("Quantos rounds selecionar?");
        round = int.parse(stdin.readLineSync()!);
        break;

      case 2:
        print("Quanto tempo de cada rodada?");
        timeRound = double.parse(stdin.readLineSync()!);
        break;

      case 3:
        print("Quanto tempo de descanso?");
        timeRest = double.parse(stdin.readLineSync()!);
        break;

      default:
        print("Sair");
    }
  }

  void play() {
    const duration = Duration(minutes: 3, seconds: 12);
    print(duration.inSeconds); // 192dar
  }

  void pause() {}

  void restart() {
    print("object");
  }

  void timeSave() {}
  void menu() {
    print(
        "MENU\n  [1] - Play\n [2] - Configure\n [3] - Pause\n [4] - restart\n [5] - Time saves");
    int option = int.parse(stdin.readLineSync()!);

    //pause só fara sentido no flutter pois time de exe.
    switch (option) {
      case 1:
        play();
        break;
      case 2:
        configurar();
        break;
      case 3:
        pause();
        break;
      case 4:
        restart();
        break;
      case 5:
        timeSave();
        break;
      default:
        print("Digite uma opção válida, por gentileza animal!");
        menu();
    }
  }

  menu();
}
