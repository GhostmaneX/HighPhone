local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = ipairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    if L7_2 == A1_2 then
      L8_2 = true
      return L8_2
    end
  end
  L2_2 = false
  return L2_2
end
has_value = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if not A1_2 then
    A1_2 = A0_2
    A0_2 = A1_2[1]
  end
  L2_2 = string
  L2_2 = L2_2.gsub
  L3_2 = A0_2
  L4_2 = "({([^}]+)})"
  function L5_2(A0_3, A1_3)
    local L2_3
    L2_3 = A1_2
    L2_3 = L2_3[A1_3]
    if not L2_3 then
      L2_3 = A0_3
    end
    return L2_3
  end
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  return L2_2
end
replace_vars = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do
    L1_2[L6_2] = L7_2
  end
  return L1_2
end
table_clone = L0_1
L0_1 = {}
L1_1 = 48
L2_1 = 57
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L0_1
  L7_1 = string
  L7_1 = L7_1.char
  L8_1 = L4_1
  L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L7_1(L8_1)
  L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
end
L1_1 = 65
L2_1 = 90
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L0_1
  L7_1 = string
  L7_1 = L7_1.char
  L8_1 = L4_1
  L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L7_1(L8_1)
  L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
end
L1_1 = 97
L2_1 = 122
L3_1 = 1
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L0_1
  L7_1 = string
  L7_1 = L7_1.char
  L8_1 = L4_1
  L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L7_1(L8_1)
  L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
end
L1_1 = string
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = math
  L1_2 = L1_2.randomseed
  L2_2 = os
  L2_2 = L2_2.time
  L2_2, L3_2, L4_2 = L2_2()
  L1_2(L2_2, L3_2, L4_2)
  if A0_2 > 0 then
    L1_2 = string
    L1_2 = L1_2.random
    L2_2 = A0_2 - 1
    L1_2 = L1_2(L2_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = L0_1
    L4_2 = #L4_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = L0_1
    L2_2 = L3_2[L2_2]
    L1_2 = L1_2 .. L2_2
    return L1_2
  else
    L1_2 = ""
    return L1_2
  end
end
L1_1.random = L2_1
L1_1 = {}
L2_1 = "mumble-voip"
L3_1 = "pma-voice"
L4_1 = "saltychat"
L5_1 = "tokovoip_script"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = 0
L3_1 = GetNumResources
L3_1 = L3_1()
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = GetResourceByFindIndex
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L7_1 = pairs
  L8_1 = L1_1
  L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1)
  for L11_1, L12_1 in L7_1, L8_1, L9_1, L10_1 do
    if L12_1 == L6_1 then
      L13_1 = GetResourceState
      L14_1 = L6_1
      L13_1 = L13_1(L14_1)
      if "started" ~= L13_1 then
        L13_1 = GetResourceState
        L14_1 = L6_1
        L13_1 = L13_1(L14_1)
        if "starting" ~= L13_1 then
          goto lbl_86
        end
      end
      L13_1 = Config
      L13_1.Voice = L6_1
      break
    end
    ::lbl_86::
  end
end
