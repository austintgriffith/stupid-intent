import Link from "next/link";
import { ethers } from "ethers";
import type { NextPage } from "next";
import { BugAntIcon, MagnifyingGlassIcon, SparklesIcon } from "@heroicons/react/24/outline";
import { MetaHeader } from "~~/components/MetaHeader";

const Home: NextPage = () => {
  const now = Date.now() / 1000;
  const future = now + 3600;

  //const hexVersion = ethers.utils.hexlify(ethers.utils.toUtf8Bytes('<YOUR_STRING>'));

  return (
    <>
      <MetaHeader />
      <div className="flex items-center flex-col flex-grow pt-10">
        <div>now:{now}</div>
        <div>future:{future}</div>
      </div>
    </>
  );
};

export default Home;
