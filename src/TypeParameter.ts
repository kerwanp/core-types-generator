import { camelize, getAnnotation } from './utils';

export class TypeParameter {
  public constructor(
    public name: string,
    public types: string[],
    public optional = false,
    public isVariadic = false,
    public description?: string
  ) {
    this.name = camelize(this.name);
    if (this.isVariadic) this.name = '...';
  }

  public getAnnotation(): string {
    if (this.isVariadic) return;
    return getAnnotation(
      'param',
      this.name,
      this.types.join('|'),
      this.description
    );
  }

  public getTypedArgument(): string {
    return `${this.name}${
      this.types.length > 0 ? ': ' + this.types.join('|') : ''
    }`;
  }
}
