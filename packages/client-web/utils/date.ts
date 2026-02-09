export const getTimeInMorS = (startTime: number, endTime: number) => {
  const $dayjs = useDayjs()
  const inMinute = $dayjs(endTime).diff($dayjs(startTime), 'minutes')
  const inSecond = $dayjs(endTime).diff($dayjs(startTime), 'seconds')
  if (inMinute <= 0) {
    return `${inSecond}s`
  } else {
    return `${inMinute}m`
  }
}