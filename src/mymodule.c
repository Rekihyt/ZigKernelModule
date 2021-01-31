// Defining __KERNEL__ and MODULE allows us to access kernel-level code not usually available to userspace programs.
#undef __KERNEL__
#define __KERNEL__
 
#undef MODULE
#define MODULE
 
#include <linux/module.h>   /* Needed by all modules */
#include <linux/kernel.h>
#include <linux/init.h>   /* Needed by all modules */
// #include <linux/module.h>   /* Needed by all modules */

#include <pms.h>

// The license type -- this 'supposedly' affects runtime behavior 
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Reki");
MODULE_DESCRIPTION("Zig");

static int __init _init_hellokernel(void) {
  return init_hellokernel();
}
module_init(_init_hellokernel);

static void __exit _exit_hellokernel(void) {
  exit_hellokernel();
}
module_exit(_exit_hellokernel);
