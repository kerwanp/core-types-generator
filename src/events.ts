import { AnnotationType, Event } from './models';
import { getAnnotation } from './utils';

export function getEvents(events: Event[]): string {
  let result = '';
  for (const event of events) {
    result += getAnnotation(AnnotationType.FIELD, event.Name, 'Event');
  }
  return result;
}
