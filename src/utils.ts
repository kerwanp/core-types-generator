export function arrayToString(rows: string[]): string {
  // TODO : Remove line breaks
  return rows.filter((row) => row !== undefined && row !== null).join('\n');
}

export function getComment(content: string): string {
  return `--- ${content.trim()}`;
}

export function getAnnotation(type: string, ...args: string[]): string {
  return getComment(`@${type} ${args.join(' ')}`);
}

export function reservedNamesMapping(name: string): string {
  if (name === 'function') {
    return 'func';
  }

  return name;
}

export function typeMapping(type: string): string {
  if (type === undefined) return 'any';
  if (type === 'integer') {
    return 'number';
  }

  if (type === 'value') {
    return 'any';
  }

  if (type.includes('Array<')) {
    type = type.replace('Array<', 'table<number, ');
  }

  return type;
}

export function camelize(content: string) {
  return content
    .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) {
      return index === 0 ? word.toLowerCase() : word.toUpperCase();
    })
    .replace(/\s+/g, '');
}

function splitDescription(description: string): string[] {
  if (description) {
    return description
      .replace(/\r\n/g, '<br>')
      .replace(/\n/g, '<br>')
      .replace(/<br \/>/g, '<br>')
      .replace(/<br\/>/g, '<br>')
      .split('<br>');
  } else {
    return [];
  }
}

export function getFullDescription(description: string): string[] {
  const lines = [];

  for (const line of splitDescription(description)) {
    lines.push(getComment(line));
    // Push empty line to add line break
    lines.push(getComment(''));
  }

  if (lines.length > 0) {
    // Remove last new line
    lines.pop();
  }

  return lines;
}

export function getShortDescription(description: string): string {
  return splitDescription(description).join('. ');
}

export function outputConsoleWarning(...params) {
  console.warn(...params);
}
