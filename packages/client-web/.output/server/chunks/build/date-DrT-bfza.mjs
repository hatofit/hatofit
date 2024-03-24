import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';

const getTimeInMorS = (startTime, endTime) => {
  const $dayjs = useDayjs();
  const inMinute = $dayjs(endTime).diff($dayjs(startTime), "minutes");
  const inSecond = $dayjs(endTime).diff($dayjs(startTime), "seconds");
  if (inMinute <= 0) {
    return `${inSecond}s`;
  } else {
    return `${inMinute}m`;
  }
};

export { getTimeInMorS as g };
//# sourceMappingURL=date-DrT-bfza.mjs.map
