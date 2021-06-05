import { getAnnotation } from './utils';

export class TypeReturn {
  public constructor(
    private types: string[] = [],
    public description?: string
  ) {}

  public addtype(type: string) {
    this.types.push(type);
  }

  public getAnnotation(): string {
    if (this.types.length <= 0) return;
    return getAnnotation(`return`, `${this.types.join('|')}`, this.description);
  }

  public getType(): string {
    return this.types.join('|');
  }
}
