import apm from 'elastic-apm-node';

export class Logger {
  private apmAgent;

  public constructor(
    private serviceName: string,
    private serverUrl = 'http://localhost:4091'
  ) {
    this.onStart();
  }

  private startApm(): void {
    this.apmAgent = apm.start({
      serviceName: this.serviceName,
      serverUrl: this.serverUrl
    });
  }

  private listenStop(): void {
    process.on('exit', () => this.onStop());
  }

  private onStart(): void {
    this.startApm();
    this.listenStop();
    this.startTransaction('running', TransactionType.LIFECYCLE);
  }

  private onStop(): void {
    this.endTransaction('running');
  }

  public startTransaction(
    name: string,
    type = TransactionType.ACTION
  ): Transaction {
    return new Transaction(this.apmAgent, name, type);
  }

  public endTransaction(name: string): void {
    this.apmAgent.endTransaction(name);
  }
}

export enum TransactionType {
  LIFECYCLE = 'lifecycle',
  ACTION = 'action',
  TASK = 'task',
  EVENT = 'event',
  HTTP_REQUEST = 'http-request'
}

export class Transaction {
  public constructor(private apmAgent: any, name: string, type: string) {
    this.apmAgent.startTransaction(name, type);
  }

  public stop(): void {
    this.apmAgent.endTransaction(name);
  }
}
