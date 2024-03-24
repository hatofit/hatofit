export const exceptObjectProp = (obj: any, exceptsNotation: string[]) => {
  const result: any = {}
  Object.keys(obj).forEach((key) => {
    if (!exceptsNotation.includes(key)) {
      result[key] = obj[key]
    }
  })
  return result
}
