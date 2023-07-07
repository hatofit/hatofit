export function Button(props: React.ComponentProps<'button'>) {
  return (
    <button
      // vercel button themes
      className="duration-300 transition-all px-4 py-2 rounded-md dark:bg-gray-700 dark:hover:bg-gray-600 bg-gray-100 hover:bg-gray-200"
      {...props}
    />
  )
}
