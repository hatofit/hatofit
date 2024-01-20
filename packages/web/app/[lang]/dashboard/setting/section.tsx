'use client'
import { Card, Input, Button } from "@/components/ui"
import { useSession } from "next-auth/react"
import { useEffect, useState } from "react"
import dayjs from "dayjs"
import utc from 'dayjs/plugin/utc'
import timezone from 'dayjs/plugin/timezone'
dayjs.extend(utc)
dayjs.extend(timezone)

export default function SettingSection() {
  const { data, status } = useSession()

  const [vals, setVals] = useState({
    name: "",
    id: "",
    firstName: "",
    lastName: "",
    email: "",
    image: "",
    dateOfBirth: dayjs(Date.now()),
    photo: "",
    weight: 0,
    height: 0,
    gender: "",
    metricUnits: {
      energyUnits: "",
      weightUnits: "",
      heightUnits: "",
    },
  })

  useEffect(() => {
    if (data && data.user) {
      setVals({
        name: data.user.name,
        id: data.user.id,
        firstName: data.user.firstName,
        lastName: data.user.lastName,
        email: data.user.email,
        image: data.user.image,
        dateOfBirth: dayjs(data.user.dateOfBirth),
        photo: data.user.photo,
        weight: data.user.weight,
        height: data.user.height,
        gender: data.user.gender,
        metricUnits: {
          energyUnits:  data.user.metricUnits.energyUnits,
          weightUnits:  data.user.metricUnits.weightUnits,
          heightUnits:  data.user.metricUnits.heightUnits,
        },
      })
    }
  }, [data, status])

  return (
    <Card.Wrapper>
      <div>
        <Card.HeaderTitle>Setting Page</Card.HeaderTitle>
      </div>
      <div className="flex flex-col gap-4">
        <div className="flex items-center">
          <label className="w-1/4">Name</label>
          <div className="flex-1 flex gap-4">
            <Input.Text placeholder="First" value={vals.firstName} onChange={(e) => setVals({...vals, firstName: e.target.value })} />
            <Input.Text placeholder="Last" value={vals.lastName} onChange={(e) => setVals({...vals, lastName: e.target.value })} />
          </div>
        </div>
        <div className="flex items-center">
          <label className="w-1/4">Email</label>
          <div className="flex-1 flex">
            <Input.Text type="email" placeholder="Email" value={vals.email} onChange={(e) => setVals({...vals, email: e.target.value })} disabled />
          </div>
        </div>
        <div className="flex items-center">
          <label className="w-1/4">Date Of Birth</label>
          <div className="flex-1 flex">
            <Input.Text type="date" placeholder="Date" value={dayjs(vals.dateOfBirth).format('YYYY-MM-DD')} onChange={(e) => setVals({...vals, dateOfBirth: dayjs(e.target.value, 'YYYY-MM-DD')})} />
          </div>
        </div>
        <div className="flex items-center">
          <label className="w-1/4">Weight</label>
          <div className="flex-1 flex">
            <Input.Text type="number" placeholder="weight" value={vals.weight} onChange={(e) => setVals({...vals, weight: parseInt(e.target.value)})} />
          </div>
        </div>
        <div className="flex items-center">
          <label className="w-1/4">Height</label>
          <div className="flex-1 flex">
            <Input.Text type="number" placeholder="height" value={vals.height} onChange={(e) => setVals({...vals, height: parseInt(e.target.value)})} />
          </div>
        </div>
        <div className="flex items-center">
          <label className="w-1/4">Gender</label>
          <div className="flex-1 flex">
            <Input.Select
              data={[ { text: 'Female', value: 'female' }, { text: 'Male', value: 'male' } ]}
              value={vals.gender}
              onChange={(e) => setVals({...vals, gender: e.target.value})}
            />
          </div>
        </div>
        <div>
          <div className="flex justify-end">
            <Button>Save</Button>
          </div>
        </div>
      </div>
    </Card.Wrapper>
  )
}
