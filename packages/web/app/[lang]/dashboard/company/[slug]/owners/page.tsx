'use client'
import Container from "@/components/layout/container";
import { Card, Input } from "@/components/ui";
import { Icon } from "@iconify/react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Fragment, useEffect, useMemo, useState } from "react";

export default function DashboardCompanyDetailPage({ params }: { params: { slug: string } }) {
  return (
    <main className="flex-1 flex flex-col">
      <Card.Wrapper>
        Welcome to settings
      </Card.Wrapper>
    </main>
  )
}
