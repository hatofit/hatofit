'use client'

import { useRouter, useParams, useSelectedLayoutSegments } from 'next/navigation';

export const LangSwitcher = (...props: any[]) => {
  const router = useRouter()
  const params = useParams()
  const urlSegments = useSelectedLayoutSegments()

  const handleLocaleChange = (event: any) => {
    const newLocale = event.target.value

    // This is used by the Header component which is used in `app/[locale]/layout.tsx` file,
    // urlSegments will contain the segments after the locale.
    // We replace the URL with the new locale and the rest of the segments.
    router.push(`/${newLocale}/${urlSegments.join('/')}`)
  };

  return (
    <div className="flex gap-2 items-center">
      <div className="text-xs">lang:</div>
      <select
        className="text-sm border border-gray-700 bg-transparent rounded px-2 py-1" name="language" id="language"
        onChange={(e) => handleLocaleChange(e)}
        value={params.lang}
      >
        <option value="en">🇬🇧 en</option>
        <option value="id">🇮🇩 id</option>
      </select>
    </div>
  )
}
