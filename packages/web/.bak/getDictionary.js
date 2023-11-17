const dictionaries = {
  en: () => import("./dictionaries/en.json").then(r => r.default),
  id: () => import("./dictionaries/id.json").then(r => r.default)
}

export const getDictionary = (lang) => {
  console.log("getDictionary", lang);
  return dictionaries[lang]();
}
