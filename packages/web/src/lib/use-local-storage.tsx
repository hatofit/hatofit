'use client'
import { Dispatch, SetStateAction, useEffect, useState } from 'react';

const useLocalStorage = <T,>(key: string, initialValue:string): [T, Dispatch<SetStateAction<T>>] => {
  const [value, setValue] = useState<T>(() => {
    if (typeof window !== 'undefined'){
      try {
          const storedValue = window.localStorage.getItem(key);
          return storedValue ? JSON.parse(storedValue) : initialValue;
      } catch (error) {
        console.error(`Error retrieving value from localStorage: ${error}`);
      }
    }
    return initialValue;
  });

  useEffect(() => {
    if (typeof window !== 'undefined') {
      try {
        const serializedValue = JSON.stringify(value);
        window.localStorage.setItem(key, serializedValue);
      } catch (error) {
        console.error(`Error storing value in localStorage: ${error}`);
      }
    }
  }, [key, value]);

  return [value, setValue];
};

export default useLocalStorage;
