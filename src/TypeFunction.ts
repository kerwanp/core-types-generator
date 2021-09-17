import { TypeSignature } from './TypeSignature';
import { getFullDescription } from './utils';

export class TypeFunction {
  public constructor(
    public name: string,
    public description: string,
    private signatures: TypeSignature[] = []
  ) {}

  public addSignature(signature: TypeSignature) {
    this.signatures.push(signature);
  }

  private getSignatureAnnotations(): string[] {
    return this.signatures[0].getAnnotations();
  }

  private getOverloadAnnotations(): string[] {
    const lines = [];
    lines.push(this.signatures[0].getOverloadAnnotation(true));
    lines.push(
      ...this.signatures
        .slice(1)
        .map((signature) => signature.getOverloadAnnotation(false))
    );
    return lines;
  }

  public getDefinition() {
    return `function ${this.name}(${this.signatures[0].getArguments()}) end`;
  }

  public getLines(): string[] {
    const lines = [];
    lines.push(...getFullDescription(this.description));
    lines.push(...this.getOverloadAnnotations());
    lines.push(...this.getSignatureAnnotations());
    lines.push(this.getDefinition());
    lines.push('');
    return lines;
  }
}
