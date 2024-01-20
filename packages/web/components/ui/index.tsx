import { locales } from "@/i18n/settings";
import { allObjExcept } from "@/utils/obj"
import RLink from 'next/link'
import { useParams } from "next/navigation";
import { useMemo } from "react";

export function Button(props: React.ComponentProps<'button'>) {
  return (
    <button
      // vercel button themes
      className={`duration-300 transition-all px-4 py-2 rounded-md dark:bg-gray-700 dark:hover:bg-gray-600 bg-gray-100 hover:bg-gray-200 ${props.className ?? ''}`}
      {...(allObjExcept(props, ["className"]))}
    />
  )
}

export namespace Card {
  export function Wrapper(props: React.ComponentProps<'div'>) {
    return (
      <div
        className={`bg-transparent rounded-lg shadow-lg p-6 border-2 border-gray-800 ${props?.className}`}
        {...allObjExcept(props, ['className'])}
      />
    )
  }

  export function HeaderTitle (props: React.ComponentProps<'div'>) {
    return (
      <div className="text-xl font-bold mb-4">{props?.children}</div>
    );
  }
}

export namespace Input {
  export function Text(props: React.ComponentProps<'input'>) {
    return (
      <input type="text" className="flex-1 px-4 py-2 rounded-lg" {...props} />
    )
  }
  export function Select(props: { data: { text: string, value: string }[] } & React.ComponentProps<'select'>) {
    return (
      <select className="flex-1 px-4 py-2 rounded-lg" {...props}>
        {props.data.map((item, index) => (
          <option key={index} value={item.value}>{item.text}</option>
        ))}
      </select>
    )
  }
}

export function Link(props: any) {
  const params = useParams()

  const link = useMemo(() => {
    const pathname = props.href || ''

    const pathnameIsMissingLocale = locales.every(
      locale => !pathname.startsWith(`/${locale}/`) && pathname !== `/${locale}`,
    );
    if (!pathnameIsMissingLocale) return pathname


    if (pathname.startsWith('/')) {
      return `${params?.lang || 'en'}${pathname}`
    }
  }, [props.href, params])

  return <RLink href={`/${link}`} {...allObjExcept(props, ['href'])} />
}
