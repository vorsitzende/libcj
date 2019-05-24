/* CJ.H - Function Declarations for LIBCJ
 * Claudia Jughashvili, 2019 */

#ifndef _CJ_H_
#define _CJ_H_

#ifdef __cplusplus
namespace cj {
  extern "C" {
#endif

    const char*   itoa    (int, char*, unsigned int);
    unsigned int  strlen  (const char*);
    unsigned char strcmp  (const char*, const char*);
    void*         memcpy  (void*, const void*, unsigned int);

#ifdef __cplusplus
  };
};
#endif

#endif  /* _CJ_H_ */
