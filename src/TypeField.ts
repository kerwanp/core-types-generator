import { getAnnotation, getShortDescription } from './utils';

export class TypeField {
  public constructor(
    private name: string,
    private types: string[] = [],
    private description?: string
  ) {}

  public toAnnotation() {
    return getAnnotation(
      'field',
      this.name,
      this.types.join(' '),
      getShortDescription(this.description)
    );
  }
}
