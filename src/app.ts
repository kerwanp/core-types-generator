import { Logger } from './logger';

export class App {
  public static logger: Logger;

  public constructor() {
    this.createLogger();
  }

  private createLogger(): void {
    App.logger = new Logger('example-app');
  }
}

new App();
