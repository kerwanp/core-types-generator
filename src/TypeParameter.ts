import { getAnnotation } from './utils';

export class TypeParameter {
  public constructor(
    public name: string,
    public types: string[],
    public optional = false,
    public description?: string
  ) {}

  public getAnnotation(): string {
    return getAnnotation(
      'param',
      this.name,
      this.types.join('|'),
      this.description
    );
  }

  public getTypedArgument(): string {
    if (this.name === 'additionalParameters') {
      console.log(this.types);
    }
    return `${this.name}${
      this.types.length > 0 ? ': ' + this.types.join('|') : ''
    }`;
  }
}
