'use client'
import Container from "@/components/layout/container";
import { Card, Input } from "@/components/ui";
import { Icon } from "@iconify/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Fragment, useMemo } from "react";

export default function DashboardCompanyDetailPage() {
  return (
    <main className="flex-1 flex flex-col">
      <Card.Wrapper>
        Welcome to dashboard
      </Card.Wrapper>
    </main>
  )
}
