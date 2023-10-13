export function allObjExcept(obj: any, keys: string[]) {
  const newObj = { ...obj }
  keys.forEach((key) => {
    delete newObj[key]
  })
  return newObj
}
export const exceptObjectProp = (obj: any, exceptsNotation: string[]) => {
  const result: any = {}
  Object.keys(obj).forEach((key) => {
    if (!exceptsNotation.includes(key)) {
      result[key] = obj[key]
    }
  })
  return result
}
