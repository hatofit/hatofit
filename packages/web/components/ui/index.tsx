import { allObjExcept } from "@/utils/obj"

export function Button(props: React.ComponentProps<'button'>) {
  return (
    <button
      // vercel button themes
      className="duration-300 transition-all px-4 py-2 rounded-md dark:bg-gray-700 dark:hover:bg-gray-600 bg-gray-100 hover:bg-gray-200"
      {...props}
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
