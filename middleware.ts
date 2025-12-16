import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

export function middleware(request: NextRequest) {
  const url = request.nextUrl.clone();
  const hostname = request.headers.get('host') || '';
  
  // Get the primary domain from environment variable or default to crelyztradeinc.com
  const primaryDomain = process.env.NEXT_PUBLIC_SITE_URL 
    ? new URL(process.env.NEXT_PUBLIC_SITE_URL).hostname
    : 'crelyztradeinc.com';
  
  // Check if the request is for www version
  if (hostname.startsWith('www.')) {
    // Remove www. and redirect to non-www
    const nonWwwHostname = hostname.replace(/^www\./, '');
    url.hostname = nonWwwHostname;
    return NextResponse.redirect(url, 301); // 301 = Permanent Redirect
  }
  
  // Optional: If you want to redirect non-www to www instead, uncomment this:
  // if (!hostname.startsWith('www.') && hostname === primaryDomain) {
  //   url.hostname = `www.${hostname}`;
  //   return NextResponse.redirect(url, 301);
  // }
  
  return NextResponse.next();
}

// Match all paths except static files and API routes
export const config = {
  matcher: [
    /*
     * Match all request paths except for the ones starting with:
     * - api (API routes)
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * - public files (images, etc.)
     */
    '/((?!api|_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp|ico|css|js)$).*)',
  ],
};

