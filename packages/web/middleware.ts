import {NextResponse, NextRequest} from 'next/server';
import {fallbackLng, locales} from './i18n/settings';

export function middleware(request: NextRequest) {
  // Check if there is any supported locale in the pathname
  const pathname = request.nextUrl.pathname;

  const pathnameIsMissingLocale = locales.every(
    locale => !pathname.startsWith(`/${locale}/`) && pathname !== `/${locale}`,
  );

  if (pathnameIsMissingLocale) {
    // We are on the default locale
    // Rewrite so Next.js understands

    // e.g. incoming request is /about
    // Tell Next.js it should pretend it's /en/about
    return NextResponse.redirect(
      new URL(`/${fallbackLng}${pathname}`, request.url),
    );
  }
}

export const config = {
  // Do not run the middleware on the following paths
  matcher:
    '/((?!api|_next/static|_next/image|manifest.json|assets|favicon.ico).*)',
};
