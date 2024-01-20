'use client'
import Container from "@/components/layout/container";
import { Card, Input } from "@/components/ui";
import { Icon } from "@iconify/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Fragment, useCallback, useMemo, useState } from "react";
import { useQRCode } from 'next-qrcode';

export default function DashboardCompanyDetailPage({ params }: any) {
  const { Canvas } = useQRCode()
  const [link, setLink] = useState(`${window.location.origin}/company/${params?.slug}`)

  const copy = useCallback(() => {
    navigator.clipboard.writeText(link)
  }, [link])

  return (
    <main className="flex-1 flex flex-col">
      <Card.Wrapper>
        Welcome to dashboard
      </Card.Wrapper>
      <Card.Wrapper className="mt-6 flex justify-center items-center gap-6">
        <div className="">
          <Canvas
            text={link}
            options={{
              errorCorrectionLevel: 'M',
              margin: 3,
              scale: 4,
              width: 200,
              color: {
                dark: '#010599FF',
                light: '#FFBF60FF',
              },
            }}
          />
        </div>
        <div className="flex-1">
          <div className="mb-2">Share this QR code to your friends</div>
          <div className="flex gap-4">
            <input type="text" className="w-full border border-gray-300 rounded-md p-2" value={link} readOnly />
            <button className="px-4 py-2 bg-primary-500 text-white rounded-md" onClick={() => copy()}>
              copy
            </button>
          </div>
        </div>
      </Card.Wrapper>
    </main>
  )
}
