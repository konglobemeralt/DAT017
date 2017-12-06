#define GPIO_E 0x40021000
#define GPIO_E_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_E_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_E_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_E_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))

#define GPIO_D 0x40020C00
#define GPIO_D_MODER ((volatile unsigned int *) (GPIO_D))
#define GPIO_D_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
#define GPIO_D_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
#define GPIO_D_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
#define GPIO_D_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
#define GPIO_D_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
#define GPIO_D_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))

#define SYSCFG 0x40013800
#define SYSCFG_MEMRMP ((volatile unsigned int*)(SYSCFG))
#define SYSCFG_PCM ((volatile unsigned int*)(SYSCFG + 0x04))
#define SYSCFG_EXTICR1 ((volatile unsigned int*)(SYSCFG + 0x08))
#define SYSCFG_EXTICR2 ((volatile unsigned int*)(SYSCFG + 0x0C))
#define SYSCFG_EXTICR3 ((volatile unsigned int*)(SYSCFG + 0x10))
#define SYSCFG_EXTICR4 ((volatile unsigned int*)(SYSCFG + 0x14))
#define SYSCFG_CMPCR ((volatile unsigned int*)(SYSCFG + 0x20))

#define EXTI 0x40013C00
#define EXTI_IMR ((volatile unsigned int*)(EXTI))
#define EXTI_EMR ((volatile unsigned int*)(EXTI + 0x04))
#define EXTI_RTSR ((volatile unsigned int*)(EXTI + 0x08))
#define EXTI_FTSR ((volatile unsigned int*)(EXTI + 0x0C))
#define EXTI_SWIER ((volatile unsigned int*)(EXTI + 0x10))
#define EXTI_PR ((volatile unsigned int*)(EXTI + 0x14))