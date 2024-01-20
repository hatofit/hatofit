import express from "express";
import { User } from "../db";

export const getUserByAuth = async (req: express.Request) => {
  // validate user
  const userId = req.auth?.user?._id;
  if (!userId || typeof userId !== "string" || userId.length === 0) return false;
  // get user
  const user = await User.findById(userId);
  if (!user?._id) return false;
  if (!user) return false

  return user
}
