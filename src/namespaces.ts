import { AnnotationType, Namespace } from './models';
import { getAnnotation } from './utils';
import { getFunction } from './signature';
import { getEvents } from './events';

export function getNamespaces(namespaces: Namespace[]): string {
  let result = '';
  for (const namespace of namespaces) {
    result += getAnnotation(AnnotationType.CLASS, namespace.Name);
    for (const func of namespace.StaticFunctions) {
      result += getAnnotation(
        AnnotationType.FIELD,
        func.Name,
        getFunction(func, false)
      );
    }

    if (namespace.StaticEvents) {
      result += getEvents(namespace.StaticEvents);
    }

    result += `${namespace.Name} = {}\n\n`;
  }
  return result;
}
