import { AnnotationType } from './models';

export function getComment(content: string): string {
  return `--- ${content}\n`;
}

export function getAnnotation(type: AnnotationType, ...args: string[]): string {
  return getComment(`@${type} ${args.join(' ')}`);
}

export function typeMapping(type: string): string {
  if (type === undefined) return 'void';
  if (type === 'integer') {
    return 'number';
  }

  if (type === 'value') {
    return 'any';
  }

  if (type.includes('Array<')) {
    console.log(type);
    type = type.replace('Array<', 'table<number, ');
  }

  return type;
}
