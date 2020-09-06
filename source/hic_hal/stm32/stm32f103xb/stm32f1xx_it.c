/**
 * @file    main.c
 * @brief   Entry point for interface program logic
 *
 * DAPLink Interface Firmware
 * Copyright (c) 2009-2018, ARM Limited, All Rights Reserved
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#include "settings.h"
#include "util.h"
#include "cortex_m.h"

#if defined ( __GNUC__ )
// gcc do not support name "psp", "msp" "lr"
// register unsigned int *_psp     asm("r13");   // psp
// register unsigned int *_msp     asm("r13");   // msp
// register unsigned int *_lr      asm("r14");   // lr
#else
register unsigned int _psp __asm("psp");
register unsigned int _msp __asm("msp");
register unsigned int _lr __asm("lr");
register unsigned int _control __asm("control");
#endif

__attribute__( ( always_inline ) ) __STATIC_INLINE uint32_t __get_LR(void)
{
  register uint32_t result;

  __ASM volatile ("MOV %0, LR\n" : "=r" (result) );
  return(result);
}

void HardFault_Handler()
{
//hexdump logic on hardfault
    uint32_t stk_ptr;
    uint32_t _lr =  __get_LR();
    uint32_t * stack = (uint32_t *)__get_PSP();

    if ((_lr & 0xF) == 0xD) { //process stack
        stack = (uint32_t *)__get_PSP();
    }

    //calculate stack ptr before fault
    stk_ptr = (uint32_t)stack + 0x20;
    if ((stack[7] & 0x200) != 0) { //xpsr bit 9 align
        stk_ptr += 0x4;
    }
    if ((_lr & 0x10) == 0) { //fp
        stk_ptr += 0x48;
    }

    config_ram_add_hexdump(_lr);       //EXC_RETURN
    config_ram_add_hexdump(__get_PSP());
    config_ram_add_hexdump(__get_MSP());
    config_ram_add_hexdump(__get_CONTROL());
    config_ram_add_hexdump(stk_ptr);   //SP
    config_ram_add_hexdump(stack[5]);  //LR
    config_ram_add_hexdump(stack[6]);  //PC
    config_ram_add_hexdump(stack[7]);  //xPSR

#ifndef __CORTEX_M
#error __CORTEX_M not defined!!
#else

#if (__CORTEX_M > 0x00)
    config_ram_add_hexdump(SCB->HFSR);
    config_ram_add_hexdump(SCB->CFSR);
    config_ram_add_hexdump(SCB->DFSR);
    config_ram_add_hexdump(SCB->AFSR);
    config_ram_add_hexdump(SCB->MMFAR);
    config_ram_add_hexdump(SCB->BFAR);
#endif

#endif //#ifndef __CORTEX_M

    util_assert(0);
    SystemReset();

    while (1); // Wait for reset
}

void MemManage_Handler(void)
{
    while(1) ;
}

void BusFault_Handler(void)
{
    while(1) ;
}


void UsageFault_Handler(void)
{
    while(1) ;
}

#if 0
  .weak SVC_Handler
  .thumb_set SVC_Handler,Default_Handler

  .weak PendSV_Handler
  .thumb_set PendSV_Handler,Default_Handler

  .weak
#endif

void DebugMon_Handler(void)
{
    while(1) ;
}

void WWDG_IRQHandler(void)
{
    while(1) ;
}

void PVD_IRQHandler(void)
{
    while(1) ;
}
void TAMPER_IRQHandlervoid(void)
{
    while(1) ;
}
void RTC_IRQHandlervoid(void)
{
    while(1) ;
}
void FLASH_IRQHandlervoid(void)
{
    while(1) ;
}
void RCC_IRQHandlervoid(void)
{
    while(1) ;
}
void EXTI0_IRQHandlervoid(void)
{
    while(1) ;
}
void EXTI1_IRQHandlervoid(void)
{
    while(1) ;
}
void EXTI2_IRQHandlervoid(void)
{
    while(1) ;
}
void EXTI3_IRQHandlervoid(void)
{
    while(1) ;
}
void EXTI4_IRQHandlervoid(void)
{
    while(1) ;
}
void DMA1_Channel1_IRQHvoid(void)
{
    while(1) ;
}
void DMA1_Channel2_IRQHvoid(void)
{
    while(1) ;
}
void DMA1_Channel3_IRQHvoid(void)
{
    while(1) ;
}
void DMA1_Channel4_IRQHvoid(void)
{
    while(1) ;
}
void DMA1_Channel5_IRQHvoid(void)
{
    while(1) ;
}
void DMA1_Channel6_IRQHvoid(void)
{
    while(1) ;
}
void DMA1_Channel7_IRQHvoid(void)
{
    while(1) ;
}
void ADC1_2_IRQHandlervoid(void)
{
    while(1) ;
}
void USB_HP_CAN1_TX_IRQHandlervoid (void)
{
    while(1) ;
}
void USB_LP_CAN1_RX0_IRQHandlervoid (void)
{
    while(1) ;
}
void CAN1_RX1_IRQHandler(void)
{
    while(1) ;
}

void CAN1_SCE_IRQHandlervoid(void)
{
    while(1) ;
}
void EXTI9_5_IRQHandlervoid(void)
{
    while(1) ;
}
void TIM1_BRK_IRQHandlervoid(void)
{
    while(1) ;
}
void TIM1_UP_IRQHandlervoid(void)
{
    while(1) ;
}
void TIM1_TRG_COM_IRQHandlervoid(void)
{
    while(1) ;
}
void TIM1_CC_IRQHandlervoid(void)
{
    while(1) ;
}
void TIM2_IRQHandlervoid (void)
{
    while(1) ;
}
void TIM3_IRQHandlervoid (void)
{
    while(1) ;
}
void TIM4_IRQHandler(void)
{
    while(1) ;
}
void I2C1_EV_IRQHandler(void)
{
    while(1) ;
}
void I2C1_ER_IRQHandler(void)
{
    while(1) ;
}


void I2C2_EV_IRQHandler(void)
{
    while(1) ;
}

void I2C2_ER_IRQHandler(void)
{

}

void SPI1_IRQHandler(void)
{
    while(1)
    ;
}
void SPI2_IRQHandler(void)
{
    while(1)
    ;
}
void USART1_IRQHandler(void)
{
    while(1)
    ;
}
void USART3_IRQHandler(void)
{
    while(1)
    ;
}
void EXTI15_10_IRQHandler(void)
{
    while(1)
    ;
}
void RTC_Alarm_IRQHandler(void)
{
    while(1)
    ;
}

void USBWakeUp_IRQHandler(void)
{
    while(1)
    ;
}
